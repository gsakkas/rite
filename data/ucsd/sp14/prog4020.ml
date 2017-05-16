
let rec reverse s =
  let n = String.length s in
  for i = 0 to (n - 1) / 2 do
    (let c = s.[i] in s.[i] <- s.[(n - i) - 1]; s.[(n - i) - 1] <- c)
  done;
  s;;

let z = [1; 2; 3; 4; 5; 6];;

let _ = reverse z;;
