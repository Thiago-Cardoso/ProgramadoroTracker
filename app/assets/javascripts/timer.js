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

  var cookie = getCookie();
  console.log("cookie:"+(Object.keys(cookie).length));
  if(Object.keys(cookie).length){
    var str_time = cookie.cronometer;

    if(str_time == 0){
      deleteCookie("cronometer");
      return false;
    }

    var minute_second = str_time.split(":");
    minute= minute_second[0];
    second= minute_second[1];
    
    var task_id = $("#div-todo tr").attr("id"); 
    if($.type(task_id) != "undefined" ){
      $('#pause_value').val(0);
      $("#initial").children().attr("disabled","disabled");
      $("#pause").children().removeClass("is-hidden");
      $("#stop").children().removeClass("is-hidden");
      $("#div-todo tr td").first().css({ backgroundColor: "#FF3860"});
      flag_interval = 0;
      callTimerInterval();
    }else{
      $('#clock').html(str_time);
    }
        
  }else{
    console.log("sem cookie - inicial");
    jsonData();
  }

});

function jsonData(){

  $.ajax({
    method:"GET",
    url: "config/",
    dataType: "json",
  }).done(function(data){
    
    // minute = 1;
    // duration_break = 1;
    minute = data.duration;
    have_song = data.have_song;
    duration_break = data.duration_break;
    duration_break_long = data.duration_break_long;
    long_pause_delay = data.long_pause_delay;

    console.log("Ciclo inicial minute:"+minute);

  })
  .fail(function(e){ 
    console.log("erro");
  });
}


function stylePauseTimer(backgroundColor="#3273DC"){
  var task_id = $("#div-todo tr").attr("id"); 
  if($.type(task_id) != "undefined"){
    $("#div-todo tr td").first().css({ backgroundColor: ""+backgroundColor+""});
  }else{
    $('#pause_value').val(1);
    $('#clock').html(str_time);  
    console.log("pausa:sem task");
    return false;
  }
}

function pauseTimer(){
  pause = parseInt($('#pause_value').val());
  if(pause===0){
    $('#pause_value').val(1);
    $("#pause").children().html("Retornar");
    $("#initial").children().removeAttr("disabled");
    console.log("pausa:"+str_time);
    
    if(flag_color === 0){
      stylePauseTimer("#3273DC");
    }
    
  }else{
    $('#pause_value').val(0);
    $("#pause").children().html("Pausar");
    console.log("continua:"+str_time);
    if(flag_color === 0){
      stylePauseTimer("#FF3860");
    }
    start(2);
  }
}

function start(control){

  // setCookie("cronometer",str_time, 1);

  if(control == 1){
    if(second != 0 || minute != 0){
      second = second +1;
      $("#div-mensagem").removeClass("is-hidden");
      $("#initial").children().attr("disabled","disabled");
      $("#pause").children().removeClass("is-hidden");
      $("#stop").children().removeClass("is-hidden");
      
      if(flag_color === 0){
        var task_id = $("#div-todo tr").attr("id"); 
        if($.type(task_id) != "undefined"){
          //seta a tarefa em execução em verde
          $("#div-todo tr td").first().css({ backgroundColor: "#FF3860"});
          flag_interval = 0;
          console.log("interacao task:"+str_time);
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
        num_pomodoro = num_pomodoro - 1;

        console.log("pausa_longa");
        $('#mensagem').html("<b>Faça uma pausa longa</b>");
        $('#clock').html(str_time);
        $('#pomodoro').html("<b>POMODORO: "+num_pomodoro+"</b>");
        $("#pomodoro").first().css({ color:"#feffff", backgroundColor: "#00D1B2"});
        $("#mensagem").first().css({ backgroundColor: "#00D1B2"});

        $(".display-remain-time").first().css({ color: "#00D1B2"});
        $(".e-c-progress").first().css({ stroke: "#00D1B2"});
        $(".e-c-pointer").first().css({ stroke: "#00D1B2"});

        console.log("flag_control2:"+flag_control);

      }else if(duration_break > 0 && flag_control === 0){ //pausa curta
        minute = duration_break;
        flag_control = 1;
        num_pomodoro = num_pomodoro - 1;

        console.log("pausa_curta");
        $('#mensagem').html("<b>Faça uma pausa curta</b>");
        $("#mensagem").first().css({ backgroundColor: "#00D1B2"});
        $("#pomodoro").first().css({ color:"#feffff", backgroundColor: "#00D1B2"});

        $(".display-remain-time").first().css({ color: "#00D1B2"});
        $(".e-c-progress").first().css({ stroke: "#00D1B2"});
        $(".e-c-pointer").first().css({ stroke: "#00D1B2"});
        
        $("#initial").children().addClass("is-hidden");
        $("#pause").children().addClass("is-hidden");
        $("#stop").children().addClass("is-hidden");
        
      }else if(flag_control === 1){
        flag_control = 0;
        flag_color = 0;
        flag_interval = 1;
        control = 1;
        jsonData();

        console.log("tempo normal");
        $('#mensagem').html("");
        $("#mensagem").first().css({ backgroundColor: "#FF3860"});
        $("#pomodoro").first().css({ color:"#feffff",backgroundColor: "#FF3860"});

        $(".display-remain-time").first().css({ color: "#FF3860"});
        $(".e-c-progress").first().css({ stroke: "#FF3860"});
        $(".e-c-pointer").first().css({ stroke: "#FF3860"});

        $("#pause").children().removeAttr("disabled");
        setTimeout('start(1);',1000);
        return false;
      }
      
      if(flag_control === 1 || flag_interval === 0){
        updateStatusTask();
      }

    }else if(second < 10 && minute == 0){
      str_time = "00:0"+second;
    }else if(minute >=1 ){
      str_time=(minute < 10 ? '0'+minute : minute)+":"+(second < 10 ? '0'+second : second);
    }else{
      str_time = "00:"+second;
    }
    callTimerInterval();
  }
}

function callTimerInterval(){
  pause = parseInt($('#pause_value').val());

  // console.log("flag_control:"+flag_control);
  // console.log("stop:"+pause);
  // console.log("str_time:"+str_time);

  if(pause === 0){
    $('#clock').html(str_time);
    $('#pomodoro').html("<b>POMODORO: "+num_pomodoro+"</b>");
    setCookie("cronometer",str_time, 1);
    setTimeout(start,1000);

    //controle de cronometro pause 
    // if(flag_control_timer === 1){
    //   console.log("flag_control2:"+flag_control);
    //   cronometerProgressBarStart();
    // }

  }else if(pause === 1){
    deleteCookie("cronometer");
  }


}

function updateStatusTask(){
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
  $('#pause_value').val(0);
  deleteCookie("cronometer");
  deleteCookie("cronometer");
  deleteCookie("cronometer");
  location.reload();
  location.reload();
}

function sound() {
  var sound = new Audio();  
  sound.src = "ding.mp3";
  sound.play();
}

function setCookie(name, value, days_to_live){
  var cookie = name + "=" + encodeURIComponent(value);
  if(typeof days_to_live === "number"){
    cookie += "; max-age="+(days_to_live*60*60*24);
    document.cookie = cookie;
  }
}

function getCookie(){
  var cookies = {};
  var all = document.cookie;

  if (all === ""){ return cookies; }
  var list = all.split("; ");
  for (var i = 0; i < list.length; i++) {
    var cookie = list[i];
    var p = cookie.indexOf("=");
    var name = cookie.substring(0,p);
    var value = cookie.substring(p+1);
    value = decodeURIComponent(value);
    cookies[name] = value;
  }
  return cookies;

}

function deleteCookie(name) {
  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}