
let stringOfList f l = List.map (f l);;

let _ = stringOfList (fun x  -> x) ["foo"];;
