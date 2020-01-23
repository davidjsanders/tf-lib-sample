locals {
    l-random = (var.resources.randomized 
        ? format(
            "-%04d",
            random_integer.unique-id.result)
        : ""
    )
}