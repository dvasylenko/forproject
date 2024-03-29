## Set the input x as a matrix
## then set the solved value "inv" as a null
## changed every reference to "mean" to "solve"
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## changed "mean" to "solve", "mm to "inv"
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}

A <- matrix(c(3,2,-1,1,-3,2,2,1,-3),3,3)
A
Ainv <- makeCacheMatrix(A)
Ainv
cacheSolve(Ainv)

