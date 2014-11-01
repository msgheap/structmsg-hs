-----------------------------------------------------------------------------
-- |
-- Module      :  Data.OrgMode.Parse.Internal
-- Copyright   :  © 2014 Parnell Springmeyer
-- License     :  All Rights Reserved
-- Maintainer  :  Parnell Springmeyer <parnell@digitalmentat.com>
-- Stability   :  stable
--
-- Internal types and utility functions.
----------------------------------------------------------------------------

{-# LANGUAGE OverloadedStrings #-}

module Data.OrgMode.Parse.Internal
( Heading  (..)
, Priority (..)
, State    (..)
, Keyword  (..)
, PropertyDrawer (..)
, Scheduled (..)
, toPriority
) where

import           Data.HashMap.Strict  (HashMap)
import           Data.Text            (Text)
import           Data.Thyme.LocalTime (LocalTime (..))

----------------------------------------------------------------------------

data Heading = Heading
    { level    :: Int
    , priority :: Maybe Priority
    , state    :: Maybe State
    , title    :: Text
    , keywords :: [Keyword]
    } deriving (Show, Eq)


data Priority = A | B | C | Unknown
  deriving (Show, Read, Eq, Ord)

newtype State = State Text
  deriving (Show, Eq)

newtype Keyword = Keyword Text
  deriving (Show, Eq, Ord)

toPriority :: Text -> Priority
toPriority "A" = A
toPriority "B" = B
toPriority "C" = C
toPriority _   = Unknown

----------------------------------------------------------------------------

newtype PropertyDrawer k v = PropertyDrawer (HashMap k v)
  deriving (Show, Eq)

----------------------------------------------------------------------------

data Scheduled = SCHEDULED | DEADLINE
  deriving (Show, Eq)

data Timestamp = Active LocalTime | Inactive LocalTime
  deriving (Show, Eq)
