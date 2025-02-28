local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("comp", {
        t({
            '#include <vector>',
            'using namespace std;',
            '#define FOR(a,b,c) for(int (a)=(b); (a) < (c); (a)++)',
            '#define FORN(a,b,c) for(int (a)=(b); (a) <= (c); (a)++)',
            '#define FORD(a,b,c) for(int (a)=(b); (a) >= (c); (a)--)',
            '#define FOREACH(a,b) for (auto& (a): (b))',
            '#define fi first',
            '#define se second',
            '#define mp make_pair',
            '#define pb push_back',
            '#define ALL(v) v.begin(), v.end()',
            '',
            'int main() {',
            '    ',
        }),
        i(1),
        t({
            '',
            '    return 0;',
            '}'
        })
    })
})

 -- * struct TreeNode {
 -- *     int val;
 -- *     TreeNode *left;
 -- *     TreeNode *right;
 -- *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 -- *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 -- *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 -- * };
ls.add_snippets("cpp", {
    s("treeleetcode", {
        t({
            'struct TreeNode {',
            '   int val;',
            '   TreeNode* left;',
            '   TreeNode* right;',
            '   TreeNode() : val(0), left(nullptr), right(nullptr) {}',
            '   TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}',
            '   TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}',
            '};',
        }),
        i(1),
    })
})
-- * struct ListNode {
 -- *     int val;
 -- *     ListNode *next;
 -- *     ListNode() : val(0), next(nullptr) {}
 -- *     ListNode(int x) : val(x), next(nullptr) {}
 -- *     ListNode(int x, ListNode *next) : val(x), next(next) {}
 -- * };

ls.add_snippets("cpp", {
    s("listleetcode", {
        t({
            'struct ListNode {',
            '   int val;',
            '   ListNode* next;',
            '   ListNode() : val(0), next(nullptr) {}',
            '   ListNode(int x) : val(x), next(nullptr) {}',
            '   ListNode(int x, ListNode *next) : val(x), next(next) {}',
            '};',
        }),
        i(1),
    })
})

ls.add_snippets("cpp", {
    s("optimize", {
        t({
            'ios::sync_with_stdio(0);',
            'cin.tie(nullptr);',
            'cout.tie(nullptr);',
        }),
        i(1),
    })
})
