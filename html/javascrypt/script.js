function toggle(clase){
  var list = document.getElementsByClassName(clase);
  var element = list[0];
  element.classList.toggle("hiden");
}

function search(){
    var input, filter, table, tr, td0, td1, td2, td3, i, text0, text1, text2, text3;
  input = document.getElementById("searchBar");
  filter = input.value.toUpperCase();
  table = document.getElementsByClassName("search")[0];
  tr = table.getElementsByTagName("tr");

  for (i = 1; i < tr.length; i++) {
	td0 = tr[i].getElementsByTagName("td")[0];
	td1 = tr[i].getElementsByTagName("td")[1];
	text0 = td0.textContent;
	text1 = td1.textContent;
    if ((text0.toUpperCase().indexOf(filter) >= 0)||(text1.toUpperCase().indexOf(filter) >= 0)) {
    	tr[i].style.display = "";
    } else {
        tr[i].style.display = "none";
    }
  }
}

function searchLiga(){
  var input, filter, table, tr, td0, td1, i, text0, text1;
input = document.getElementById("searchBar");
filter = input.value.toUpperCase();
table = document.getElementsByClassName("search")[0];
tr = table.getElementsByTagName("tr");

for (i = 1; i < tr.length; i++) {
td0 = tr[i].getElementsByTagName("td")[0];
td1 = tr[i].getElementsByTagName("td")[1];
td2 = tr[i].getElementsByTagName("td")[2];
td3 = tr[i].getElementsByTagName("td")[3];
text0 = td0.textContent;
text1 = td1.textContent;
text2 = td2.textContent;
text3 = td3.textContent;
  if ((text0.toUpperCase().indexOf(filter) >= 0)||(text1.toUpperCase().indexOf(filter) >= 0)
  || (text2.toUpperCase().indexOf(filter) >= 0) || (text3.toUpperCase().indexOf(filter) >= 0)) {
    tr[i].style.display = "";
  } else {
      tr[i].style.display = "none";
  }
}
}

function searchPartido(){
  var input, filter, table, tr, td0, td1, td2, td3, td5, i, text0, text1, text2, text3,text5;
input = document.getElementById("searchBar");
filter = input.value.toUpperCase();
table = document.getElementsByClassName("search")[0];
tr = table.getElementsByTagName("tr");

for (i = 1; i < tr.length; i++) {
td0 = tr[i].getElementsByTagName("td")[0];
td1 = tr[i].getElementsByTagName("td")[1];
td2 = tr[i].getElementsByTagName("td")[2];
td3 = tr[i].getElementsByTagName("td")[3];
td5 = tr[i].getElementsByTagName("td")[5];
text0 = td0.textContent;
text1 = td1.textContent;
text2 = td2.textContent;
text3 = td3.textContent;
text5 = td5.textContent;
  if ((text0.toUpperCase().indexOf(filter) >= 0)||(text1.toUpperCase().indexOf(filter) >= 0)
  || (text2.toUpperCase().indexOf(filter) >= 0) || (text3.toUpperCase().indexOf(filter) >= 0)
  || (text5.toUpperCase().indexOf(filter) >= 0)) {
    tr[i].style.display = "";
  } else {
      tr[i].style.display = "none";
  }
}
}
