
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let innerFunc elem = Printf.printf "Element is %d\n" elem in
     List.iter innerFunc n);;
