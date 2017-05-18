
let rec listReverse l = match l with | [] -> [] | h::x -> (listReverse x) @ h;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
