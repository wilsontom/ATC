context('ATC-codes')

test_that('ATC-codes', {

  expect_true(is.data.frame(search_atc_code('A10BA02')))
  expect_error(search_atc_code('A02B'))

})
