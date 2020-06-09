//
//  PokerHand.m
//  Blackjack
//
//  Created by Andrew Cain on 17/05/12.
//  Copyright (c) 2012 Swinburne University of Technology. All rights reserved.
//

#import "PokerHand.h"
#import "Card.h"

@implementation PokerHand

//-(id) init
//{
//    if ( self = [super init])
//    {
//        _sorted = [[NSMutableArray alloc] initWithCapacity:5];
//    }
//    return self;
//}

-(BOOL) needsEvaluate
{
    return self.count == 5;
}

//-(void) sortCards
//{
//    [_sorted removeAllObjects];
//    int idx;
//    
//    for (Card *card in _cards) 
//    {
//        for (idx = 0; idx < [_sorted count]; idx++) 
//        {
//            Card *other = [_sorted objectAtIndex:idx];
//            if ( card.aceHighRank > other.aceHighRank )
//            {
//                // Break out of loop as this card has a larger value than the other card
//                break;
//            }
//            else if ( card.rank == other.rank)
//            {
//                // Compare suits - Clubs, Diamonds, Hearts, Spades (highest)
//                if ( card.suit > other.suit ) break;
//            }
//        }
//        
//        [_sorted insertObject:card atIndex:idx];
//    }
//}

-(void) rebuildHand
{
    Rank rank;
    NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray:_cards];
    [_cards removeAllObjects];
    
    for (int i = 0; i < 5; i++) 
    {
        rank = _cardFreq[i].rank;
        
        // Dont need this as...
        //for (int j = 0; j < _cardFreq[i].count; j++)
        {
            for ( Card *card in tmp )
            {
                if ( card.rank == rank )
                {
                    [_cards addObject:card];
                    //[tmp removeObject:card];
//                    break;
                }
            }
        }
    }
}

-(void) determineFrequency
{
    for (int i = 0; i < 13; i++) 
    {
        _cardFreq[i].count = 0;
        _cardFreq[i].rank = (Rank)(i + 1);
    }

    for (Card *card in _cards) 
    {
        _cardFreq[(int)card.rank - 1].count++;
    }
    
    //sort
    for (int i = 0; i < 5; i++) 
    {
        for (int j = i + 1; j < 13; j++) 
        {
            Rank iCard, jCard;
            iCard = _cardFreq[i].rank;
            jCard = _cardFreq[j].rank;
            
            if (iCard == ACE) iCard = ACE_HIGH;
            if (jCard == ACE) jCard = ACE_HIGH;
            
            // Swap if the count is smaller, or if the count if the same but the rank smaller
            if ( _cardFreq[i].count < _cardFreq[j].count || 
                ( _cardFreq[i].count == _cardFreq[j].count && ( iCard < jCard )))
            {
                card_freq temp = _cardFreq[i];
                _cardFreq[i] = _cardFreq[j];
                _cardFreq[j] = temp;
            }
        }
    }
}

-(BOOL) flush
{
    Suit s = [[_cards objectAtIndex:0] suit];
    for(Card *card in _cards)
    {
        if ( [card suit] != s ) return NO;
    }
    return YES;
}

-(BOOL) straight
{
    if (_cardFreq[0].count == 1) 
    {
        Rank highest, lowest, second;
        highest = [[_cards objectAtIndex:0] aceHighRank];
        second = [[_cards objectAtIndex:1] rank];
        lowest = [[_cards objectAtIndex:4] rank];
        
        return  (highest - lowest == 4) || 
                (highest == ACE_HIGH && second == FIVE && lowest == TWO) ;
    }
    else return false;
}

-(BOOL) fourOfAKind
{
    return _cardFreq[0].count == 4;
}

-(BOOL) fullHouse
{
    return _cardFreq[0].count == 3 && _cardFreq[1].count == 2;
}

-(BOOL) threeOfAKind
{
    return _cardFreq[0].count == 3;
}

-(BOOL) twoPair
{
    return _cardFreq[0].count == 2 && _cardFreq[1].count == 2;
}

-(BOOL) twoOfAKind
{
    return _cardFreq[0].count == 2;
}

-(BOOL) aceKing
{
    Card *first, *second;
    first = [_cards objectAtIndex:0];
    second = [_cards objectAtIndex:1];
    
    return first.rank == ACE && second.rank == KING;
}

-(BOOL) aceFive
{
    Card *first, *second;
    first = [_cards objectAtIndex:0];
    second = [_cards objectAtIndex:1];
    
    return first.rank == ACE && second.rank == FIVE;
}


#define ROYAL_FLUSH 10
#define STRAIGHT_FLUSH 9
#define FOUR_OF_A_KIND 8
#define FULL_HOUSE 7
#define FLUSH 6
#define STRAIGHT 5
#define THREE_OF_A_KIND 4
#define TWO_PAIR 3
#define PAIR 2
#define HIGH_CARD 1

-(void) evaluate
{
    [self determineFrequency];
//    [self sortCards];
    [self rebuildHand];
    
    BOOL straight, flush;
    straight = [self straight];
    flush = [self flush];
    
    if (straight && flush) 
    {
        if ( [self aceKing] )
            _score = ROYAL_FLUSH;
        else
            _score = STRAIGHT_FLUSH;
    }
    else if ( [self fourOfAKind] )  _score = FOUR_OF_A_KIND;
    else if ( [self fullHouse] )    _score = FULL_HOUSE;
    else if (flush )                _score = FLUSH;
    else if (straight )             _score = STRAIGHT;
    else if ( [self threeOfAKind] ) _score = THREE_OF_A_KIND;
    else if ( [self twoPair] )      _score = TWO_PAIR;
    else if ( [self twoOfAKind] )   _score = PAIR;
    else _score = HIGH_CARD;
}

-(Card *) scoringCard:(int)idx
{
    if ( (_score == STRAIGHT || _score == STRAIGHT_FLUSH) && [self aceFive] )
        return [_cards objectAtIndex:(idx + 1) % 5 ];
    else
        return [_cards objectAtIndex:idx];
}

-(int) compareTo:(PokerHand *)other
{
    int scoreDiff;
    
    scoreDiff = _score - [other score];
    
    if (scoreDiff != 0) return scoreDiff;
    
    if (_score == 0) return 0;
    
    // They are the same kind of score!
    switch (_score) {
        case FOUR_OF_A_KIND:
        case THREE_OF_A_KIND:
        case FULL_HOUSE:
            scoreDiff = [[self cardAt:0] compareTo:[other cardAt:0] rankAndSuit:NO];
            break;
        case PAIR:
            scoreDiff = [[self cardAt:0] compareTo:[other cardAt:0] rankAndSuit:NO];
            if ( scoreDiff == 0 ) scoreDiff = [[self cardAt:2] compareTo:[other cardAt:2]];
            break;
        case TWO_PAIR:
            scoreDiff = [[self cardAt:0] compareTo:[other cardAt:0] rankAndSuit:NO];
            if ( scoreDiff == 0 ) scoreDiff = [[self cardAt:2] compareTo:[other cardAt:2] rankAndSuit:NO];
            if ( scoreDiff == 0 ) scoreDiff = [[self cardAt:4] compareTo:[other cardAt:4]];
            break;
        case FLUSH:
            scoreDiff = [[self cardAt:0] compareTo:[other cardAt:0]];
            break;
        case STRAIGHT_FLUSH:
        case STRAIGHT:
            scoreDiff = [[self cardAt:0] compareTo:[other cardAt:0] rankAndSuit:YES];
            break;
            // fall through ...
        case ROYAL_FLUSH:
            scoreDiff = [self cardAt:0].suit - [other cardAt:0].suit;
            break;
        default:
            scoreDiff = [[self cardAt:0] compareTo:[other cardAt:0] rankAndSuit:YES];
    }
    return scoreDiff;
}

-(NSString *) description
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:[super description]];
    
    if ( [self allFaceUp] && self.count == 5 )
    {
        switch (_score) 
        {
            case ROYAL_FLUSH:
                [result appendString:@"Royal Flush!"];
                break;
            case STRAIGHT_FLUSH:
                [result appendString:@"Straight Flush"];
                break;
            case FOUR_OF_A_KIND:
                [result appendString:@"Four of a Kind"];
                break;
            case FULL_HOUSE:
                [result appendString:@"Full House"];
                break;
            case FLUSH:
                [result appendString:@"Flush"];
                break;
            case STRAIGHT:
                [result appendString:@"Straight"];
                break;
            case THREE_OF_A_KIND:
                [result appendString:@"Three of a Kind"];
                break;
            case TWO_PAIR:
                [result appendString:@"Two Pair"];
                break;
            case PAIR:
                [result appendString:@"Two of a Kind"];
                break;
            default:
                break;
        }
    }
    return result;
}


@end
