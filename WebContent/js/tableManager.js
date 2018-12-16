let contacts = [];
let tableBody;
let searchValue;

function getContactsAndTableBody() {
  tableBody = document.getElementById('tableBody');
  let contactName;
  let contactSurname;
  let contactPhone;
  for (let i = 0; i < tableBody.rows.length; i++) {
	contactName = tableBody.rows[i].cells[0].innerHTML;
	contactSurname = tableBody.rows[i].cells[1].innerHTML;
	contactPhone = tableBody.rows[i].cells[2].innerHTML;
	contacts.push(new contact(contactName, contactSurname, contactPhone))
  }
}

function doSearch() {
  searchValue = document.getElementById('searchInput').value;
  deleteAllRows();
  if(searchValue == '') {
	  showAllContacts();
  } else {
	  showSearchedContacts();
  }
}

function deleteAllRows() {
  let curentContactLength = document.getElementById('tableBody').rows.length;
  console.log(curentContactLength);
  for (let i = 0; i < curentContactLength; i++) {
		tableBody.deleteRow(0);
  }
}

function showAllContacts() {
  let row;
  let cellName;
  let cellSurname;
  let cellPhone;
  for (let i = contacts.length - 1; i >= 0; i--) {
	row = tableBody.insertRow(0);
	cellName = row.insertCell(0);
	cellSurname = row.insertCell(1);
	cellPhone = row.insertCell(2);
	cellName.innerHTML = contacts[i].name;
	cellSurname.innerHTML = contacts[i].surname;
	cellPhone.innerHTML = contacts[i].phone;
  }
}

function showSearchedContacts() {
	let row;
	let cellName;
	let cellSurname;
	let cellPhone;
	let criteria = document.getElementById('searchCriteria').value;
	
	switch(criteria) {	
	
	case 'Name': for (let i = contacts.length - 1; i >= 0; i--) {
					 if(contacts[i].name.toUpperCase().includes(searchValue.toUpperCase())) {
						row = tableBody.insertRow(0);
						cellName = row.insertCell(0);
						cellSurname = row.insertCell(1);
						cellPhone = row.insertCell(2);
						cellName.innerHTML = contacts[i].name;
						cellSurname.innerHTML = contacts[i].surname;
						cellPhone.innerHTML = contacts[i].phone;
					 }
				  }
				  break;
				  

	case 'Surname': for (let i = contacts.length - 1; i >= 0; i--) {
					 if(contacts[i].surname.toUpperCase().includes(searchValue.toUpperCase())) {
						row = tableBody.insertRow(0);
						cellName = row.insertCell(0);
						cellSurname = row.insertCell(1);
						cellPhone = row.insertCell(2);
						cellName.innerHTML = contacts[i].name;
						cellSurname.innerHTML = contacts[i].surname;
						cellPhone.innerHTML = contacts[i].phone;
					 }
				  }
				  break;
				  

	case 'Phone': for (let i = contacts.length - 1; i >= 0; i--) {
					 if(contacts[i].phone.includes(searchValue)) {
						row = tableBody.insertRow(0);
						cellName = row.insertCell(0);
						cellSurname = row.insertCell(1);
						cellPhone = row.insertCell(2);
						cellName.innerHTML = contacts[i].name;
						cellSurname.innerHTML = contacts[i].surname;
						cellPhone.innerHTML = contacts[i].phone;
					 }
				  }
				  break;
	}
	
	
}