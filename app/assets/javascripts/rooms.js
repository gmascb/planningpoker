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

var AddUsuarioSala = function(){
  
  if (document.getElementById('textroom_playersname').value.indexOf(document.getElementById('room_selectuser').value) == -1)
  {
    if (!document.getElementById('textroom_playersname').value.length > 0 )
      document.getElementById('textroom_playersname').value += document.getElementById('room_selectuser').value 
    else
      document.getElementById('textroom_playersname').value += ', ' + document.getElementById('room_selectuser').value
  }
}




/* Controla Responsavel da Sala */
var AddResponsavelSala = function(){
  
  if (document.getElementById('textroom_responsavel').value.indexOf(document.getElementById('room_selectresponsavel').value) == -1)
  {
    if (!document.getElementById('textroom_responsavel').value.length > 0 )
      document.getElementById('textroom_responsavel').value += document.getElementById('room_selectresponsavel').value 
    else
      document.getElementById('textroom_responsavel').value += ', ' + document.getElementById('room_selectresponsavel').value
  }
}

var AtivaCampoResponsavel = function(){
  document.getElementById("textroom_responsavel").disabled = false;
}

var RemoveTodosResponsaveis = function(){
  document.getElementById("textroom_responsavel").value = "";
}

var RemoveResponsavelSala = function(){
  
  var indice = document.getElementById('textroom_responsavel').value.indexOf(document.getElementById('room_selectresponsavel').value);
  var indiceVirgula = document.getElementById('textroom_responsavel').value.indexOf(', ');
  
  if (indice != -1)
  {
    var value = document.getElementById("textroom_responsavel").value;
    
    if (indice == 0)
      value = value.replace(document.getElementById('room_selectresponsavel').value,"");
    
    if (indice > 0)
      value = value.replace(', ' + document.getElementById('room_selectresponsavel').value,"");

    if (indice == 0 && indiceVirgula != -1 )
      value = value.replace(', ',"");

    document.getElementById('textroom_responsavel').value = value;
  
  }
}