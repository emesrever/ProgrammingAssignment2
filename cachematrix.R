## creates a cached matrix that can be retrieved from memory
## Also creates/retrieves its cached inverse

## Creates a specific object to store a matrix and cache its inverse
makeCacheMatrix <- function(x = matrix()) {
        #initialize the inverse
        inv <- NULL
        #Cache the matrix into this specific environment
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInv <- function(inverse) inv <<- inverse
        getInv <- function() inv
        #return a list that contains all of these functions,
        #allowing them to be accessible
        list(set = set, get = get, setInv = setInv,
             getInv = getInv)
}


## Returns the inverse of the matrix x. If the inverse does not
## exist, then compute it.
cacheSolve <- function(x, ...) {
        ## First check if the inverse has already been computed
        inv <- x$getInv()
        if (!is.null(inv)) {
                message("getting cached data")
                return (m)
        }
        ## Since it hasn't, get the inverse, cache it, and return it.
        data <- x$get()
        inv <- solve(data, ...)
        x$setInv(inv)
        inv
}