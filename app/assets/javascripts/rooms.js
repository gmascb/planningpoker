
var AddUsuarioSala = function(){
  
  if (document.getElementById('textroom_playersname').value.indexOf(document.getElementById('room_selectuser').value) == -1)
  {
    if (!document.getElementById('textroom_playersname').value.length > 0 )
      document.getElementById('textroom_playersname').value += document.getElementById('room_selectuser').value 
    else
      document.getElementById('textroom_playersname').value += ', ' + document.getElementById('room_selectuser').value
  }
}


var RemoveUsuarioSala = function(){
  
  var indice = document.getElementById('textroom_playersname').value.indexOf(document.getElementById('room_selectuser').value);
  var indiceVirgula = document.getElementById('textroom_playersname').value.indexOf(', ');
  
  if (indice != -1)
  {
    var value = document.getElementById("textroom_playersname").value;
    
    if (indice == 0)
      value = value.replace(document.getElementById('room_selectuser').value,"");
    
    if (indice > 0)
      value = value.replace(', ' + document.getElementById('room_selectuser').value,"");

    if (indice == 0 && indiceVirgula != -1 )
      value = value.replace(', ',"");

    document.getElementById('textroom_playersname').value = value;
  
  }
}

var RemoveTodos = function(){
  document.getElementById("textroom_playersname").value = "";
}


var AtivaCampo = function(){
  document.getElementById("textroom_playersname").disabled = false;
}

