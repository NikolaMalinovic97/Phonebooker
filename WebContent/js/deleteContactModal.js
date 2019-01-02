let getDeleteOption; //This variable grabs select DOM node
let deleteText; //This variable grabs the text of selected option

let contactDeleteName;
let contactDeleteSurname;
let contactDeletePhone;

let getDeleteNameInput;
let getDeleteSurnameInput;
let getDeletePhoneInput;

function setDeleteValues() {
  getDeleteOption = document.getElementById("deleteContactModalSelect");
  deleteText = getDeleteOption.options[getDeleteOption.selectedIndex].text;
  
  getDeleteNameInput = document.getElementById("deleteName");
  getDeleteSurnameInput = document.getElementById("deleteSurname");
  getDeletePhoneInput = document.getElementById("deletePhone");
  
  contactDeleteName = getContactName(deleteText);
  contactDeleteSurname = getContactSurname(deleteText);
  contactDeletePhone = getContactPhone(deleteText);
  
  getDeleteNameInput.value = contactDeleteName;
  getDeleteSurnameInput.value = contactDeleteSurname;
  getDeletePhoneInput.value = contactDeletePhone;
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