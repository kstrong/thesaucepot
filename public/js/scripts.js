$(function() {
	
$.validator.setDefaults({
	submitHandler: function() {
		document.location.href='/contact/thank-you.php';
	}
});

$.validator.setDefaults({
	submitHandler: function() {
		$('.submit-button').attr('disabled','disabled').attr('value','Please Wait...');
		form.submit();
	}
});

$().ready(function() {
	var form = $( "#contact-form" );
	form.validate();
});

});