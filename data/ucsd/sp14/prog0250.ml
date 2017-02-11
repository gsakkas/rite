
let rec listReverse l = match l with | [] -> [] | h::t -> (listReverse t) @ h;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
