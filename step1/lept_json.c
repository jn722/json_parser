#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

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

static int lept_parse_literal(lept_context *ctx, lept_value*v, const char *literal, int type) {
    size_t i; 
    EXPECT(ctx, *literal);
    
    for(i = 0; literal[i+1]; i ++) {
        if(ctx->json[i] != literal[i+1]) {
            return LEPT_PARSE_INVALID_VALUE;
        }
    }
   
    v->type = type;
    ctx->json += i;
    return LEPT_PARSE_OK;
    
}

static int lept_parse_null(lept_context *ctx, lept_value *v){
    return lept_parse_literal(ctx, v, "null", LEPT_NULL);
}

static int lept_parse_true(lept_context *ctx, lept_value *v) {
    return lept_parse_literal(ctx, v, "true", LEPT_TRUE);
}

static int lept_parse_false(lept_context *ctx, lept_value *v) {
    return lept_parse_literal(ctx, v, "false", LEPT_FALSE);
}

#define ISDIGIT(c) ((c) >= '0' && (c) <= '9')
#define ISDIGIT1TO9(c) ((c) >= '1' && (c) <= '9')

static int lept_parse_number(lept_context *ctx, lept_value *v) {
    int err_number;
    char *end;

    if(ctx->json[0] != '-' && !ISDIGIT(ctx->json[0])) {
        return LEPT_PARSE_INVALID_VALUE;
    }
    else if( ctx->json[0] == '-' &&  !ISDIGIT(ctx->json[1])) {
        return LEPT_PARSE_INVALID_VALUE;
    } 
    else if( ctx->json[0] == '0' && ISDIGIT(ctx->json[1])) {
        return LEPT_PARSE_INVALID_VALUE;
    }

    /*检验数字合法性*/
    v->n = strtod(ctx->json, &end);
    err_number = errno;
    if(err_number == ERANGE && !(fabs(v->n-0.0)<1e-15)) {
        return LEPT_PARSE_NUMBER_TOO_BIG;
    } 
    ctx->json = end;
    v->type = LEPT_NUMBER;
    return LEPT_PARSE_OK;
}

static int lept_parse_value(lept_context *ctx, lept_value *v){
    switch(*ctx->json) {
        case 'n': return lept_parse_null(ctx, v);
        case 't': return lept_parse_true(ctx, v);
        case 'f': return lept_parse_false(ctx, v);
        default: return lept_parse_number(ctx, v);
        case '\0': return LEPT_PARSE_EXPECT_VALUE;
    }
}

int lept_parse(lept_value *v, const char *json) {
    lept_context ctx;
    int ret;
    assert(v != NULL);
    ctx.json = json;
    v->type = LEPT_NULL;
    lept_parse_whitespace(&ctx);
    if((ret = lept_parse_value(&ctx, v)) == LEPT_PARSE_OK) {
        lept_parse_whitespace(&ctx);
        if(*ctx.json != '\0') {
            ret = LEPT_PARSE_ROOT_NOT_SINGULAR;
        }
    }
    return ret;
}

lept_type lept_get_type(const lept_value *v)
{
    return v->type;
}

double lept_get_number(const lept_value *v) {
    assert(v != NULL && v->type == LEPT_NUMBER);
    return v->n;
}
