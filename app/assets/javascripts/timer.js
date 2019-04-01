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
  $(".completar" ).click(function() {
    window.location.reload();
  });
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
  var sound = new Audio();  
  sound.src = "ding.mp3";
  sound.play();
}