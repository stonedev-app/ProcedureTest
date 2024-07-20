INERT INTO dateTable(
    CONVERT(int, date)
)
SELECT TT. yearMonthDay AS date
FROM (
  SELECT CASE WHEN TRIM(monthDay01) = '' THEN '' ELSE year + monthDay01 END AS yearMonthDay FROM #tmpTable
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay02) = '' THEN '' ELSE year + monthDay02 END AS yearMonthDay FROM #tmpTable
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay03) = '' THEN '' ELSE year + monthDay03 END AS yearMonthDay FROM #tmpTable
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay04) = '' THEN '' ELSE year + monthDay04 END AS yearMonthDay FROM #tmpTable
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay05) = '' THEN '' ELSE year + monthDay05 END AS yearMonthDay FROM #tmpTable
  ・
  ・
  ・
  ・
  ・
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay28) = '' THEN '' ELSE year + monthDay28 END AS yearMonthDay FROM #tmpTable
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay29) = '' THEN '' ELSE year + monthDay29 END AS yearMonthDay FROM #tmpTable
  UNION ALL
  SELECT CASE WHEN TRIM(monthDay30) = '' THEN '' ELSE year + monthDay30 END AS yearMonthDay FROM #tmpTable
)  TT
WHERE TT. yearMonthDay <> ''