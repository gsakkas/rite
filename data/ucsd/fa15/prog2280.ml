
let rec removeZero l =
  let h::t = l in
  if h = [] then [] else (match h with | 0::[] -> removeZero t | _ -> t);;

let _ = removeZero [0; 0; 0; 0];;
