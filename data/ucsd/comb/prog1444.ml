
let stringOfList f l = List.map (fun x  -> Printf.sprintf "%s" x) l;;

let _ = stringOfList string_of_int [1; 2; 3; 4; 5; 6];;
