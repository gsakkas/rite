
let rec listReverse l = match l with | [] -> [] | h::t -> [h; 2; 2];;

let _ = listReverse ["a"; "b"; "c"; "d"];;
