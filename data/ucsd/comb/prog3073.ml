
let rec listReverse l = match l with | [] -> [] | a::b -> (listReverse b) @ a;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
