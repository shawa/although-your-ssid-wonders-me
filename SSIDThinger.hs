import Data.Bits
import Data.List
import qualified Data.ByteString.Char8 as B
import Crypto.Hash

type MacAddress = Int
type SerialNumber = String
type WepKey = B.ByteString

netopiaMac :: Int
netopiaMac = 0x000fcc

netopiaSerialBegin :: Int
netopiaSerialBegin = 0x01000000

jimi :: String
jimi = "Although your world wonders me, "

getMac :: String -> MacAddress
getMac ssid = oct `xor` netopiaMac
              where oct = read ("0o" ++ ssid) :: Int


getSerialNumber :: MacAddress -> SerialNumber
getSerialNumber mac = show (mac + netopiaSerialBegin)

wordify :: Char -> String
wordify '1' = "One"
wordify '2' = "Two"
wordify '3' = "Three"
wordify '4' = "Four"
wordify '5' = "Five"
wordify '6' = "Six"
wordify '7' = "Seven"
wordify '8' = "Eight"
wordify '9' = "Nine"
wordify _   = ""

computeWep :: String -> WepKey
computeWep mac = (B.take 26 . sha1Hex . B.pack) (mac' ++ jimi)
                 where mac'      = concat (map wordify mac)
                       sha1Hex s = digestToHexByteString (hash s :: Digest SHA1)

thinger :: String -> String
thinger ssid = (show . computeWep . getSerialNumber . getMac) ssid

main :: IO ()
main = interact thinger
