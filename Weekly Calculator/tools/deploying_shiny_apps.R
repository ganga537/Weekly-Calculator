#install.packages('rsconnect')
library(rsconnect)

rsconnect::setAccountInfo(name='gauravganve',
                          token='636480A3AD23627B2D49354A52B9D343',
                          secret='G+QssRfH1P3l0VvlrHTFVQLu0219e8YtXNMoo1qP')

rsconnect::deployApp()


