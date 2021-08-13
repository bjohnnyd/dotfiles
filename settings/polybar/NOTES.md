# External Modules


## polybar-spotify
- got from `https://github.com/PrayagS/polybar-spotify`
- modify and update `get_spotify_status.sh`
- depends on `playerctl`
- possible metadata naming can be found here: `https://github.com/altdesktop/playerctl/#printing-properties-and-metadata`
- pulled into scripts:
  - `curl -LO https://raw.githubusercontent.com/PrayagS/polybar-spotify/master/get_spotify_status.sh`
  - `curl -LO https://raw.githubusercontent.com/PrayagS/polybar-spotify/master/scroll_spotify_status.sh`
  - then modify `get_spotify_status.sh`
  - then modify `scroll_spotify_status.sh` whith the correct path to `get_spotify_status.sh`
- in polybar config add:
    ```
    [module/spotify]
	type = custom/script
	tail = true
	; prefix symbol is shown before the text
	format-prefix = "<prefix-symbol>"
	format = <label>
	exec = ~/.config/polybar/scripts/scroll_spotify_status.sh

	[module/spotify-prev]
	type = custom/script
	exec = echo "<previous-song-symbol>"
	format = <label>
	click-left = playerctl previous spotify

	[module/spotify-play-pause]
	type = custom/ipc
	hook-0 = echo "<playing-symbol>"
	hook-1 = echo "<pause-symbol>"
	initial = 1
	click-left = playerctl play-pause spotify

	[module/spotify-next]
	type = custom/script
	exec = echo "next-song-symbol"
	format = <label>
	click-left = playerctl next spotify
    ```
