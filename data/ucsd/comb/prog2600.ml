
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let _ = (removeZero [0; 0; 0; 0] 18) / 10;;
