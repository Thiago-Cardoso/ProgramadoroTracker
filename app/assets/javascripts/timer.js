var second = new Number();  
var str_time = new Number();
var minute = new Number(); 

var num_pomodoro = 1;
var cont_flag_pomodoro = 1;
var flag_color = 0;
var flag_control = 0;
var flag_interval = 0;

var have_song = "";
var duration_break = "";
var duration_break_long = "";
var long_pause_delay = "";

var second= 0;
var pause = 0;
var control = 1;

$(function(){
  json_data();
});

function json_data(){

  $.ajax({
    method:"GET",
    url: "config/",
    dataType: "json",
  }).done(function(data){
    
    minute = data.duration;
    have_song = data.have_song;
    duration_break = data.duration_break;
    duration_break_long = data.duration_break_long;
    long_pause_delay = data.long_pause_delay;

  })
  .fail(function(e){ 
    console.log(e);
  });
}

function pause_timer(){
  pause = parseInt($('#pause_value').val());
  var task_id = $("#div-todo tr").attr("id"); 
  if(pause===0){
    $('#pause_value').val(1);
    $("#pause").children().html("Retornar");
    $("#initial").children().removeAttr("disabled");

    if(flag_color === 0){
      if($.type(task_id) != "undefined"){
        $("#div-todo tr td").first().css({ backgroundColor: "#3273DC"});
      }else{
        $('#pause_value').val(1);
        $('#clock').html(str_time);  
        return false;
      }
    }
    
  }else{
    $('#pause_value').val(0);
    $("#pause").children().html("Pausar");

    if(flag_color === 0){
      if($.type(task_id) != "undefined"){
        $("#div-todo tr td").first().css({ backgroundColor: "#FF3860"});
      }else{
        $('#pause_value').val(1);
        $('#clock').html(str_time);
        return false;
      }
    }
    start(2);
  }
}

function start(control){
  
  if(control == 1){
    if(second != 0 || minute != 0){
      second = second +1;
      $("#initial").children().attr("disabled","disabled");
      $("#pause").children().removeClass("is-hidden");
      $("#stop").children().removeClass("is-hidden");
      
      if(flag_color === 0){
        var task_id = $("#div-todo tr").attr("id"); 
        if($.type(task_id) != "undefined"){
          //seta a tarefa em execução em verde
          $("#div-todo tr td").first().css({ backgroundColor: "#FF3860"});
          flag_interval = 0;
        }else{
          $('#clock').html(str_time);
          stop();
          return false;
        }
      }
    }
  }

  if(control == 2){
    $("#initial").children().attr("disabled","disabled");
  }

  $(document).ready(function() {
    $(this).attr("title", str_time+" ProgamadoroTracker");
  });

  if(minute > 0 && second === 0){
    second = 60;
    minute--;
  }

  if((second - 1) >= 0){
    second = second - 1;
    if(second == 0 && minute == 0){
      if(have_song){ sound(); }
      str_time = "00:00";  
      num_pomodoro++;
      cont_flag_pomodoro++; 

      //pausa longa
      if( (long_pause_delay > 0) && (cont_flag_pomodoro === long_pause_delay) ){
        //troca a cor do relogio
        minute = duration_break_long;
        flag_color = 1;
        cont_flag_pomodoro = 1;
        flag_control = 1;
        
        $('#mensagem').html("<b>Faça uma pausa longa</b>");
        $('#clock').html(str_time);
        $('#pomodoro').html("<b>POMODORO: "+num_pomodoro+"</b>");
        $("#clock").first().css({ backgroundColor: "#00D1B2"});
        $("#pomodoro").first().css({ color:"#feffff", backgroundColor: "#00D1B2"});
        $("#mensagem").first().css({ backgroundColor: "#00D1B2"});
        
      }else if(duration_break > 0 && flag_control === 0){ //pausa curta
        minute = duration_break;
        flag_control = 1;

        $('#mensagem').html("<b>Faça uma pausa curta</b>");
        $("#mensagem").first().css({ backgroundColor: "#00D1B2"});
        $("#clock").first().css({ backgroundColor: "#00D1B2"});
        $("#pomodoro").first().css({ color:"#feffff", backgroundColor: "#00D1B2"});
        $("#initial").children().attr("disabled","disabled");
        
      }else if(flag_control === 1){
        flag_control = 0;
        flag_color = 0;
        flag_interval = 1;
        control = 1;
        json_data();

        $('#mensagem').html("");
        $("#mensagem").first().css({ backgroundColor: "#FF3860"});
        $("#clock").first().css({ backgroundColor: "#FF3860"});
        $("#pomodoro").first().css({ color:"#feffff",backgroundColor: "#FF3860"});
        $("#pause").children().removeAttr("disabled");
        setTimeout('start(1);',1000);
        return false;
      }
      
      if(flag_control === 1 || flag_interval === 0){
        atualizaStatusTask();
      }

    }else if(second < 10 && minute == 0){
      str_time = "00:0"+second;
    }else if(minute >=1 ){
      str_time=(minute < 10 ? '0'+minute : minute)+":"+(second < 10 ? '0'+second : second);
    }else{
      str_time = "00:"+second;
    }
    call_timer_interval();
  }
}

function call_timer_interval(){
  pause = parseInt($('#pause_value').val());
  if(pause === 0){
    $('#clock').html(str_time);
    $('#pomodoro').html("<b>POMODORO: "+num_pomodoro+"</b>");
    setTimeout(start,1000);
  }
}

function atualizaStatusTask(){
  // pega a primeira tarefa
  var task_id = $("#div-todo tr").attr("id"); 
  if($.type(task_id) != "undefined"){
    $.ajax({
      method: "POST",
      url: "setStatusTask/",
      data: {task_id: task_id},
      dataType: "json",
    }).done(function(return_data){
      if(return_data.status){
        $("#"+return_data.id).remove(); 
        var todo = (parseInt($("#div-todo").text()) - 1);
        var done = (parseInt($("#div-done").text()) + 1);
        $("#div-todo").text(todo);
        $("#div-done").text(done);
      }
      
    }).fail(function(e){
      console.log("erro");
    });
  }

}

function stop(){
	location.reload();
}

function sound() {
  var sound = new Audio("data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");  
  sound.play();
}