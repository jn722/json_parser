#include <assert.h>
#include <ctype.h>
#include <stdio.h>

#include "lept_json.h"

#define EXPECT(c, ch) do { \
    assert(*c->json==ch);\
    c->json++; \
}while(0)

typedef struct {
    const char* json;
}lept_context;


static void lept_parse_whitespace(lept_context *ctx) {
    const char *p = ctx->json;
    while(isspace((int)*p)) p ++;

    ctx->json = p;
}

static int lept_parse_null(lept_context *ctx, lept_value *v){
    EXPECT(ctx, 'n');
    if(ctx->json[0] != 'u' || ctx->json[1] != 'l' || ctx->json[2] != 'l') {
        return LEPT_PARSE_INVALID_VALUE;
    }
    ctx->json += 3;
    v->type = LEPT_NULL;
    return LEPT_PARSE_OK;
}

static int lept_parse_value(lept_context *ctx, lept_value *v){
    switch(*ctx->json) {
        case 'n': return lept_parse_null(ctx, v);
        case '\0': return LEPT_PARSE_EXPECT_VALUE;
        default: return LEPT_PARSE_INVALID_VALUE;
    }
}

int lept_parse(lept_value *v, const char *json) {
    lept_context ctx;
    assert(v != NULL);
    ctx.json = json;
    v->type = LEPT_NULL;
    lept_parse_whitespace(&ctx);
    return lept_parse_value(&ctx, v);
}