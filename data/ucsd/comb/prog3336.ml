
let rec fixpoint (f,x) = let x' = f x in if x' = x then x else fixpoint f x';;
