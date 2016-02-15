let pipe fs = 
  let f acc el = el acc in
  let base x = x in
    List.fold_left f base fs

let _ = pipe [(fun y -> y + y); (fun z -> z + 3)] 3
