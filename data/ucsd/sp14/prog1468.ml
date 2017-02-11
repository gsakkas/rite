
let rec factorial x acc =
  if x = 0 then acc else factorial (x -. 1.0) (x *. acc);;
