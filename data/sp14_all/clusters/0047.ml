LamG (IteG EmptyG EmptyG EmptyG)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if b = f b
  then (b , false)
  else (b , true)
fun x ->
  if x = f x
  then (x , false)
  else (f x , true)
fun b ->
  if a > b then a else b
fun b ->
  if a < b then b else a
fun b ->
  if a < b then b else a
fun (count , n) ->
  if n < 10
  then count + 1
  else addHelp (count + 1 , addNum n)
fun digitList ->
  if n = 0
  then digitList
  else digits (n / 10)
              ((n mod 10) :: digitList)
fun digitList ->
  if n = 0
  then digitList
  else digits (n / 10)
              ((n mod 10) :: digitList)
fun digitList ->
  if n = 0
  then digitList
  else digits (n / 10)
              ((n mod 10) :: digitList)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun (x , n , acc) ->
  if n < 0
  then acc
  else cloneHelper (x , n - 1 , x :: acc)
fun b ->
  if a = 0
  then b
  else integers (a / 10)
                ((a mod 10) :: b)
fun b ->
  if a = 0
  then b
  else integers (a / 10)
                ((a mod 10) :: b)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
fun n ->
  if n = 0
  then [0]
  else getDigits n
fun n ->
  if n = 0
  then [0]
  else getDigits n
fun n ->
  if n = 0
  then [0]
  else getDigits n
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
fun f' ->
  if f b = b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun a ->
  if b = f b
  then (b , false)
  else (f b , true)
fun n ->
  if n < 1
  then accum
  else x :: accum
fun n ->
  if n < 1
  then accum
  else x :: accum
fun n ->
  if n < 10
  then 1
  else 1 + additivePersistence (sumList (digitsOfInt n))
fun b ->
  if (10 * a) > b
  then a
  else helpFac (10 * a) b
fun a ->
  if n = 0
  then a
  else loop (n / 10)
            ((n mod 10) :: a)
fun l ->
  if i > 0
  then helper i (bigAdd acc l) l
  else acc
fun l ->
  if i > 0
  then helper i (bigAdd acc l) l
  else acc
