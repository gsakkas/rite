
let stringOfList f l = List.map (fun x  -> f l);;

let _ =
  stringOfList (stringOfList string_of_int) [[1; 2; 3]; [4; 5]; [6]; []];;
