// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GlobalMusicControl(){
	
	if (!audio_is_playing(sBGM)) {
    audio_play_sound(sBGM, 1, true);
}


}