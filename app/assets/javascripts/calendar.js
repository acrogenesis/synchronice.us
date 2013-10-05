$(document).ready(function() {

    // page is now ready, initialize the calendar...
    $('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
    
    $('#calendar').fullCalendar({
        // put your options and callbacks here
      defaultView: "agendaWeek",
      titleFormat:{
                    month: "MMM",
                    week: "",
                    day: "dddd"
                  },
    firstDay:1,
      allDaySlot: false,
      slotMinutes: 60,
      defaultEventMinutes: 60,
      minTime: '6:00am',
      maxTime: '8:00pm',
      columnFormat: {
        week: 'dddd'
      },
      header: {
        right: ''
      },
      selectable: true,
      editable: true,
      droppable: true,
      drop: function(date, allDay) { // this function is called when something is dropped
			
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
				
			}
    });

});
