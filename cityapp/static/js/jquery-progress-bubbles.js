/**
 * @package jQuery Progress Bubbles
 * @author Jesse O'Brien <jesse at jesse-obrien.ca>
 * @date	April 2012
 * @license DWTFYWTPL
 *
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details.
 */

(function( $ ){

	/**
	 * Draw function that will draw, or re-draw the progress bubbles
	 * @param element jQuery element which is the parent of the bubbles
	 * @param settings Settings object that should have at minimum 2 properties, bubbles and progress
	 */
	var draw = function(element, settings){
    	var root = $(element);

    	if( root.hasClass('progress-bubbles') )
    	{
    		root.empty();
    	}

    	root.addClass('progress-bubbles');

    	// Loop through the bubbles and add them one by one
    	$.each( settings.bubbles, function(index, bubble){

    		// No progress or progress is less than this item, set it to neutral
    		if( settings.progress < (index + 1) || ! settings.progress )
    		{
    			var html = '<div class="bubble">';
    		}
    		// Progressed to this item
    		else if( settings.progress == (index + 1) )
    		{
    			var html = '<div class="bubble active">';
    		}
    		// Progressed has passed this item
    		else if( settings.progress > (index + 1) )
    		{
    			var html = '<div class="bubble complete">';
    		}

    		// Add the title above the element
    		html += '<div class="bubble-title">' + bubble.title + '</div>';

    		// Add a checkmark if the element is completed as the content
    		if( settings.progress > ( index + 1))
    		{
    			html += '<div class="bubble-value">&#10004;</div>';
    		}
    		// Add the current item as a number if we still need to complete it
    		else
    		{
    			html += '<div class="bubble-value">' + (index+1) + '</div>';
    		}

    		// Close up the bubble
    		html += '</div>';

    		// Add the connector
    		if( index < settings.bubbles.length -1  ){
    			html += '<div class="connector"></div>';
    		}

    		// Append that html, yeah!
    		root.append(html);
    	});
	};

	var methods = {
    init : function( options ) {

    	return this.each( function(){
    		var $this = $(this),
    			data = $this.data('settings');

  			if( ! data )
  			{
  				// Default bubbles
  				var settings = $.extend(
						{ 'bubbles' : [
								{ title: 'Start' },
								{ title: 'Middle' },
								{ title: 'End' }
							],
							progress : 1
						},
						options
					);

  				$this.data('settings', settings );
  			}

  			// Draw the bubbles
			draw(this, settings);
    	});

    },
    // This function can be called to progress the active step
    progress : function( new_progress ) {
    	$this = $(this);
  		var settings = $(this).data('settings');
    	new_progress = typeof new_progress !== 'undefined' ? new_progress : settings.progress+1;
        if( new_progress < settings.bubbles.length + 2 )
        {
            settings.progress = new_progress;
  		    $(this).data('settings', settings);

            if( new_progress !== NaN || new_progress <= settings.bubbles.length)
            {
                draw(this, settings);
            }
            else
            {
                console.err("Error, progress was not a number");
            }
        }
    },
    // This function can be called to regress the active step
    regress : function( new_progress ) {
    	$this = $(this);
  		var settings = $(this).data('settings');
    	new_progress = typeof new_progress !== 'undefined' ? new_progress : settings.progress-1;
        if( new_progress > -1 )
        {
      		settings.progress = new_progress;
      		$(this).data('settings', settings);

        	if( new_progress !== NaN || new_progress <= settings.bubbles.length && new_progress >= 0 )
        	{
        		draw(this, settings);
        	}
        	else
        	{
        		console.err("Error, progress was not a number");
        	}
        }
    },
  };

  $.fn.progressBubbles = function( method ) {
    // Method calling logic
    if ( methods[method] ) {
      return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
    } else if ( typeof method === 'object' || ! method ) {
      return methods.init.apply( this, arguments );
    } else {
      $.error( 'Method ' +  method + ' does not exist on jQuery.tooltip' );
    }
  };
})( jQuery );