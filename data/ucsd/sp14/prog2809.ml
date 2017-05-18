
let stringOfList f l = List.map (fun x  -> Printf.sprintf "%d" x) l;;

let _ = stringOfList (fun x  -> x) ["foo"];;
