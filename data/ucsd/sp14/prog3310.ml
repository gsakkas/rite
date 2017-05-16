
let rec palinHelper normal reverse =
  match normal with
  | [] -> true
  | x::xs ->
      if x = (List.hd reverse) then palinHelper xs List.tl reverse else false;;
