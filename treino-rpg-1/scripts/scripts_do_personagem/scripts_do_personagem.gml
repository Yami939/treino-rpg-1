// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_andando(){
#region movimentação
direita = keyboard_check(ord("D"));
esquerda = keyboard_check(ord("A"));
cima = keyboard_check(ord("W"));
baixo = keyboard_check(ord("S"));

//andar esquerda e direita
hvelocidade = (direita - esquerda) * velocidade;

//andar cima e baixo
vvelocidade = (baixo - cima) * velocidade;

#endregion

#region colisão perfeita

//colisão horizontal
if place_meeting(x + hvelocidade,y,oParede){
	while !place_meeting(x + sign(hvelocidade), y, oParede){
		x += sign(hvelocidade);	
	}
	
		hvelocidade = 0;
	
}

x += hvelocidade;

//colisão vertical
if place_meeting(x,y + vvelocidade, oParede){
	while !place_meeting(x, y + sign(vvelocidade), oParede){
		y += sign(vvelocidade);
	}
	
	vvelocidade = 0;
	
}

y += vvelocidade;

#endregion

#region mudar as sprites em 4 direções parado/andando

direcao = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);

if hvelocidade == 0 and vvelocidade == 0{
switch direcao{
	default:
		sprite_index = sPersonagem_parado_direita
	break;
	case 1:
		sprite_index = sPersonagem_parado_cima
	break;
	case 2:
		sprite_index = sPersonagem_parado_esquerda
	break;
	case 3:
		sprite_index = sPersonagem_parado_baixo
	break;
	}
}else{
	switch direcao{
	default:
		sprite_index = sPersonagem_correndo_direita
	break;
	case 1:
		sprite_index = sPersonagem_correndo_cima
	break;
	case 2:
		sprite_index = sPersonagem_correndo_esquerda
	break;
	case 3:
		sprite_index = sPersonagem_correndo_baixo
	break;
	}
}
#endregion

	//checar se o botão direito foi apertado, e o que ele fara
	if mouse_check_button_pressed(mb_right){
	alarm[0] = 8;
	dash_direcao = point_direction(x,y, mouse_x, mouse_y);
	estado = scr_personagem_dash;
	}
}

//para onde o dash ira
function scr_personagem_dash(){
	hvelocidade = lengthdir_x(dash_velocidade, dash_direcao);
	vvelocidade = lengthdir_y(dash_velocidade, dash_direcao);
	
	x += hvelocidade;
	y += vvelocidade;
	
	//criar efeito de velocidade
	var _inst = instance_create_layer(x,y, "Instances", oDash);
	_inst.sprite_index = sprite_index;
}