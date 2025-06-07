"use client"

import { useState } from "react"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Button } from "@/components/ui/button"
import { ArrowLeft, Search, FileText } from "lucide-react"
import { useRouter } from "next/navigation"
import { ThemeProvider } from "@/components/theme-provider"
import { ThemeToggle } from "@/components/theme-toggle"

export default function Dashboard() {
  return (
    <ThemeProvider attribute="class" defaultTheme="dark" enableSystem disableTransitionOnChange>
      <DashboardPage />
    </ThemeProvider>
  )
}

function DashboardPage() {
  const router = useRouter()
  const [activeTab, setActiveTab] = useState("job-search")

  return (
    <div className="min-h-screen bg-slate-100 dark:bg-slate-900 text-slate-900 dark:text-white">
      <div className="container mx-auto px-4 py-8">
        <div className="flex justify-between items-center mb-6">
          <Button
            variant="ghost"
            onClick={() => router.push("/")}
            className="text-slate-600 dark:text-slate-300 hover:text-slate-900 dark:hover:text-white"
          >
            <ArrowLeft className="mr-2 h-4 w-4" /> 메인으로 돌아가기
          </Button>
          <ThemeToggle />
        </div>

        <h1 className="text-3xl font-bold mb-8">SpecTrackr 대시보드</h1>

        <Tabs defaultValue="job-search" value={activeTab} onValueChange={setActiveTab} className="w-full">
          <TabsList className="grid w-full max-w-md grid-cols-2 mb-8">
            <TabsTrigger value="job-search" className="text-lg py-3">
              <Search className="mr-2 h-4 w-4" /> 채용공고 검색
            </TabsTrigger>
            <TabsTrigger value="spec-search" className="text-lg py-3">
              <FileText className="mr-2 h-4 w-4" /> 스펙 검색
            </TabsTrigger>
          </TabsList>

          <TabsContent
            value="job-search"
            className="p-6 bg-white dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700"
          >
            <h2 className="text-2xl font-bold mb-4">채용공고 검색</h2>
            <p className="text-slate-600 dark:text-slate-300 mb-6">
              다양한 취업 사이트의 채용공고를 한 곳에서 확인하고 비교할 수 있습니다. 원하는 직무나 회사를 검색해보세요.
            </p>

            {/* 여기에 채용공고 검색 기능 구현 */}
            <div className="p-12 text-center text-slate-500 dark:text-slate-400 border border-dashed border-slate-300 dark:border-slate-600 rounded-lg">
              채용공고 검색 기능이 여기에 구현됩니다.
            </div>
          </TabsContent>

          <TabsContent
            value="spec-search"
            className="p-6 bg-white dark:bg-slate-800 rounded-lg border border-slate-200 dark:border-slate-700"
          >
            <h2 className="text-2xl font-bold mb-4">스펙 검색</h2>
            <p className="text-slate-600 dark:text-slate-300 mb-6">
              실제 합격자 자소서와 스펙 사례를 기반으로 현실적인 준비 방법을 확인할 수 있습니다. 관심 있는 직무나 회사를
              검색해보세요.
            </p>

            {/* 여기에 스펙 검색 기능 구현 */}
            <div className="p-12 text-center text-slate-500 dark:text-slate-400 border border-dashed border-slate-300 dark:border-slate-600 rounded-lg">
              스펙 검색 기능이 여기에 구현됩니다.
            </div>
          </TabsContent>
        </Tabs>
      </div>
    </div>
  )
}
