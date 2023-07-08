#!/usr/bin/env python

import tiktoken
import sys

def count_openai_tokens(document):
    # for gpt-4, gpt-3.5-turbo
    enc = tiktoken.get_encoding("cl100k_base")
    tokens = enc.encode(document)
    token_count = len(tokens)
    return token_count

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python token_counter.py <document>")
        sys.exit(1)

    document_path = sys.argv[1]

    with open(document_path, "r", encoding="utf-8") as file:
        document_text = file.read()

    token_count = count_openai_tokens(document_text)
    print("Number of OpenAI tokens:", token_count)
    print("Query cost: ${:.2f}".format(token_count/1000 * 0.03))
    print("Total cost: ${:.2f}".format(token_count/1000 * 0.03 + 300/1000 * 0.06))
