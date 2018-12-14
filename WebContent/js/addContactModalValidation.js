let name;
let surname;
let phone;
let disabledStatus;
let message;
let getAlert;

function initialize() {
  name = document.getElementById("addContactName").value;
  surname = document.getElementById("addContactSurname").value;
  phone = document.getElementById("addContactPhone").value;
  disabledStatus = document.getElementById("addContactSubmit");
  getAlert = document.getElementById("addContactAlert");
}

function validate() {
  initialize();
  if(isNameValid() && isSurnameValid() && isPhoneValid()) {
	getAlert.classList.remove('alert-danger');
	getAlert.classList.add('alert-success');
    message = "You can now add contact.";
    disabledStatus.disabled = false;
  } else {
    disabledStatus.disabled = true;
  }
  document.getElementById("addContactAlert").innerHTML = message;
}

function isNameValid() {
  initialize();
  if (name.length < 1 || name.length > 40) {
    message = '<p>Name length has to be beetween 1 and 40 characters!</p>';
    return false;
  } else {
    return true;
  }
}

function isSurnameValid() {
  initialize();
  if (surname.length < 1 || surname.length > 40) {
    message = '<p>Surname length has to be beetween 1 and 40 characters!</p>';
    return false;
  } else {
    return true;
  }
}

function isPhoneValid() {
  initialize();
  if(phone.length < 1 || phone.length > 20) {
    message = '<p>Phone numbers length has to be beetween 1 and 20 digits!</p>';
    return false;
  }
  let char;
  for (let i = 0; i < phone.length; i++) {
    char = phone.charCodeAt(i);
    if (char < 48 || char > 57) {
      message = '<p>Phone number can include only digits!</p>';
      return false;
    }
  }
  return true;
}