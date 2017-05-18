
let pipe fs =
  let f a x = let g n = x (a n) in g in
  let base x = x in List.fold_left f base fs;;

let x = let y = 10 in y;;

let _ =
  pipe
    [(fun x  -> x + 3);
    (fun x  -> x + x);
    (fun y  -> x = 2);
    (fun x  -> x + 1)] 3;;
