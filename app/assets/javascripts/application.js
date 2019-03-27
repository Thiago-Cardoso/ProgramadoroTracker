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
});

$(document).on('turbolinks:before-cache', clearCalendar);
