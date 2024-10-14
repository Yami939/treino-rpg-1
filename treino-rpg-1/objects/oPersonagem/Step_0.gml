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

#region mudar as sprites em 4 direções

direcao = floor(point_direction(x, y, mouse_x, mouse_y)/90);

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

#endregion