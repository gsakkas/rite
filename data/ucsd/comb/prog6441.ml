
let rec listReverse l = match l with | [] -> [] | h::t -> h @ [];;

let _ = listReverse ["a"; "b"; "c"; "d"];;
