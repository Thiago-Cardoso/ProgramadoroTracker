// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require moment
//= require fullcalendar
//= require jquery-ui
//= require Chart.bundle.min
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function() {
	(function() {
		var burger = document.querySelector('.burger');
		var nav = document.querySelector('#' + burger.dataset.target);
		burger.addEventListener('click', function() {
			burger.classList.toggle('is-active');
			nav.classList.toggle('is-active');
		});
		$('#btnTaskInsert').hide();
	})();
});

// fullcalendar
function eventCalendar() {
	return $('#calendar').fullCalendar({
		events: [
			{
				title: 'task1',
				start: '2019-03-01'
			},
			{
				title: 'tas2',
				start: '2019-03-05',
				end: '2019-01-07'
			},
			{
				title: 'task3',
				start: '2019-03-09T12:30:00',
				allDay: true
			}
		]
	});
}

function clearCalendar() {
	$('#calendar').fullCalendar('delete');
	$('#calendar').html('');
}

$(document).on('turbolinks:load', function() {
	eventCalendar();
	//task edit and insert
	$('button#edit').on('click', function() {
		var id = $(this).data('id');
		var id_cat = $(this).data('id_cat');
		var description = $(this).data('description');
		$('#task_description').val(description);
		$('#task_category_id').val(id_cat);

		$('#frmtask').append('<input type="hidden" name="_method" value="patch" />');
		$('#frmtask').attr('action', '/tasks/' + id);

		$('#btnTask').text('Editar');
		$('#btnTaskInsert').show();
		$('#btnTaskInsert').text('Inserir Novo');
	});

	$('button#btnTaskInsert').on('click', function() {
		$('#task_description').val();
		$('#task_category_id').val();
	});

	$('#datepicker1').datepicker({ dateFormat: 'dd-mm-yy' });
	$('#datepicker2').datepicker({ dateFormat: 'dd-mm-yy' });

		$('#template').on('change', function() {
	
		var input = $("#template :selected").text();

		var fields = input.split(' ');
		var configuration_task_duration = fields[1];
		var configuration_task_duration_break = fields[2];
		var configuration_task_duration_break_long = fields[3];
		var configuration_task_long_pause_delay = fields[4];

		$("#configuration_task_duration").val(configuration_task_duration);
		$("#configuration_task_duration_break").val(configuration_task_duration_break);
		$("#configuration_task_duration_break_long").val(configuration_task_duration_break_long);
		$("#configuration_task_long_pause_delay").val(configuration_task_long_pause_delay);

	  });

});

$(document).on('turbolinks:before-cache', clearCalendar);

// Datepicker - Ui
$(function() {

	//notification
	$(document).on('click', '.notification > button.delete', function() {
		$(this).parent().addClass('is-hidden');
		return false;
	});

});
