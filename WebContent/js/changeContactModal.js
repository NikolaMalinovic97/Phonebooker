let getOption; //This variable grabs select DOM node
let text; //This variable grabs the text of selected option
let contactName;
let contactSurname;
let contactPhone;
let getNameInput;
let getSurnameInput;
let getPhoneInput;

function setContactValues() {
  getOption = document.getElementById("changeContactModalSelect");
  text = getOption.options[getOption.selectedIndex].text;
  
  getNameInput = document.getElementById("changeContactNameInput");
  getSurnameInput = document.getElementById("changeContactSurnameInput");
  getPhoneInput = document.getElementById("changeContactPhoneInput");
  
  contactName = getContactName(text);
  contactSurname = getContactSurname(text);
  contactPhone = getContactPhone(text);
  
  getNameInput.value = contactName;
  getSurnameInput.value = contactSurname;
  getPhoneInput.value = contactPhone;
  
  console.log(contactName);
  console.log(contactSurname);
  console.log(contactPhone);
}

//This method extracts name out of option text
function getContactName(string) {
  let result = "";
  for (var i = 0; i < string.length; i++) {
    if (string[i] == ' ') {
      break;
    } else {
      result += string[i];
    }
  }
  return result;
}

//This method extracts surname out of option text
function getContactSurname(string) {
  let result = "";
  let spaceCount = 0;
  for (var i = 0; i < string.length; i++) {
    if (string[i] == ' ') {
      spaceCount++;
      if(spaceCount == 2) {
        break;
      }
    } else if(spaceCount == 1){
      result += string[i];
    }
  }
  return result;
}

//This method extracts phone number out of option text
function getContactPhone(string) {
  let result = "";
  let spaceCount = 0;
  for (var i = 0; i < string.length; i++) {
    if (string[i] == ' ') {
      spaceCount++;
    } else if(spaceCount == 2){
      result += string[i];
    }
  }
  return result;
}
