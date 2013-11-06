$(document).ready(function(){
 
 $('#member-form').validate(
 {
  rules: {
    firstname: {
      minlength: 2,
      required: true
    },
    lastname: {
      minlength: 2,
      required: true
    },
    nin: {
      minlength: 16,
      maxlength: 16,
      required: true
    },
    email: {
      required: true,
      email: true
    },
    birthplace: {
      minlength: 2,
      required: true
    },
    birthyear: {
      minlength: 4,
      number: true,
      min: 1900,
      max: 2050,
      required: true
    },
    birthmonth: {
      minlength: 1,
      maxlength: 2,
      number: true,
      min: 1,
      max: 12,
      required: true
    },
    birthday: {
      minlength: 1,
      maxlength: 2,
      number: true,
      min: 1,
      max: 31,
      required: true
    },
    idcard: {
      minlength: 6,
      required: true
    },
    token_serial: {
      minlength: 8,
      required: true
    },
    residence_address: {
      minlength: 6,
      required: true
    },
    residence_city: {
      minlength: 2,
      required: true
    },
    residence_province: {
      minlength: 2,
      maxlength: 2,
      required: true
    },
    residence_postcode: {
      minlength: 4,
      required: true
    },
    domicile_address: {
      minlength: 6,
      required: true
    },
    domicile_city: {
      minlength: 2,
      required: true
    },
    domicile_province: {
      minlength: 2,
      maxlength: 2,
      required: true
    },
    domicile_postcode: {
      minlength: 4,
      required: true
    }
  },
  highlight: function(element) {
    $(element).closest('.control-group').removeClass('success').addClass('error');
  },
  success: function(element) {
    element
    .text('OK!').addClass('valid')
    .closest('.control-group').removeClass('error').addClass('success');
  }
 });
});
