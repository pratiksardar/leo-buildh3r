program buldh3r.aleo {

    record Token {
        owner: address,
        amount: u64,
    }

    transition mint(owner: address, amount: u64) -> Token {
        return Token {
            owner: owner,
            amount: amount,
        };
    }

    transition transfer(token: Token, to: address, amount: u64) -> (Token, Token) {

        let sender_new_amount: u64 = token.amount - amount;
        let recipient: Token = Token {
            owner: to,
            amount: amount,
        };
        let sender: Token = Token {
            owner: token.owner,
            amount: sender_new_amount,
        };

        return (recipient, sender);
    }
}

// TOKEN: owner:aleo132paecrmzpn22w5mqn5vfvvt5ce3hu4gct7pfshfnfdaguvjsy8qxrxfk8, amount:1100