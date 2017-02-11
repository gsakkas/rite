
let base x = x;;

let crack a x = x;;

let _ =
  List.fold_left crack base [(fun x  -> ((x * x), (fun x  -> x + 2)))] 3;;
