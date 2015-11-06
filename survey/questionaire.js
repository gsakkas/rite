var getChar;
if ( jQuery.browser.msie ) {
    getChar = function( evt ) {
        return String.fromCharCode( evt.keyCode );
    }
} else {
    getChar = function( evt ) {
        return String.fromCharCode( evt.charCode );
    }
}

function dump( obj ) {
    var msg = "";
    for ( var item in obj )
        msg += item + ": " + obj[ item ] + "\n";
    return msg;
}

function validateNumber( event ) {
    var c = getChar( event );
    if ( ( '0' <= c && c <= '9' ) || c == '.' )
        return true;

    if ( event.keyCode == 8 )
        // backspace
        return true;
    if ( event.keyCode == 9 )
        // tab
        return true;
    if ( event.keyCode > 36 && event.charCode < 41 )
        // arrows
        return true;
    return false;
}

function validateForm() {
    var missing = 0;
    var data = new Object();
    $("input[type=text], textarea").each(function(){
        if ( $(this).val() == "" && ! $(this).hasClass( "optional" ) ) {
            $(this).addClass( "missing" );
            missing++;
        } else {
            $(this).removeClass( "missing" );
            data[ this.id ] = this.value;
        }
    });
    if ( missing != 0 ) {
        alert( "Please provide answers for all questions" );
        return false;
    }

    $.ajax({
        url:      "survey.py",
        type:     "post",
        dataType: "json",
        data:     data
    })
    .success( function( response ) {
        if ( response.error ) {
            alert( response.error );
            return;
        } else {
            $("body").html( response.body );
            window.scrollTo( 0, 0 );
        }
    })
    .error( function( event, request, settings ) {
        alert(
            "Error submitting survey."
            + "\nrequest:\n" + dump( request )
            + "\nsettings:\n" + dump( settings )
        );
    });
}

