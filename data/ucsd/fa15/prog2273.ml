
let rec removeZero l =
  let h::t = l in match h with | [] -> [] | 0::[] -> removeZero t | _ -> t;;

let _ = removeZero [9; 9];;
